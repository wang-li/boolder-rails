import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = [ "map" ]
  static values = { 
    bounds: Object,
    problem: Object,
  }

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1Ijoibm1vbmRvbGxvdCIsImEiOiJja2hwMXMzZWgwcndhMnJrOHY1a3c0eHE5In0.F4P_5ZCsauDFiSqrxqjZ8w';

    this.map = new mapboxgl.Map({
    container: 'map',
    // FIXME: use prod source (not draft)
    style: 'mapbox://styles/nmondollot/cl95n147u003k15qry7pvfmq2/draft', //  mapbox://styles/mapbox/outdoors-v11 
    center: [2.60269269238, 48.36702248583],
    zoom: 10
    });

    const scale = new mapboxgl.ScaleControl({
      maxWidth: 100,
      unit: 'metric'
    });
    this.map.addControl(scale);

    // Add zoom and rotation controls to the map.
    this.map.addControl(new mapboxgl.NavigationControl());

    this.map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserHeading: true
    }));

    let that = this

    this.map.on('load', () => {
      that.map.addSource('problems', {
        type: 'vector',
        url: 'mapbox://nmondollot.4xsv235p' 
      });

      that.map.addLayer({
        'id': 'problems',
        'type': 'circle',
        'source': 'problems',
        'source-layer': 'problems-ayes3a',
        'minzoom': 15,
        'layout': {
          // Make the layer visible by default.
          'visibility': 'visible'
        },
        'paint': {
          'circle-radius': 
            [
              "interpolate",
              ["linear"],
              ["zoom"],
              15,
              2,
              18,
              4,
              22,
              [
                "case",
                ["has", "circuitId"],
                16,
                10
              ]
            ]
          ,
          'circle-color':  // FIXME: make it DRY
            [
              "case",
              [
                "match",
                ["get", "circuitColor"],
                ["", "yellow"],
                true,
                false
              ],
              "#FFCC02",
              [
                "match",
                ["get", "circuitColor"],
                ["", "purple"],
                true,
                false
              ],
              "#D783FF",
              [
                "match",
                ["get", "circuitColor"],
                ["", "orange"],
                true,
                false
              ],
              "#FF9500",
              [
                "match",
                ["get", "circuitColor"],
                ["", "green"],
                true,
                false
              ],
              "#77C344",
              [
                "match",
                ["get", "circuitColor"],
                ["", "blue"],
                true,
                false
              ],
              "#017AFF",
              [
                "match",
                ["get", "circuitColor"],
                ["", "skyblue"],
                true,
                false
              ],
              "#5AC7FA",
              [
                "match",
                ["get", "circuitColor"],
                ["", "salmon"],
                true,
                false
              ],
              "#FDAF8A",
              [
                "match",
                ["get", "circuitColor"],
                ["", "red"],
                true,
                false
              ],
              "#FF3B2F",
              [
                "match",
                ["get", "circuitColor"],
                ["", "black"],
                true,
                false
              ],
              "#000",
              [
                "match",
                ["get", "circuitColor"],
                ["", "white"],
                true,
                false
              ],
              "#FFFFFF",
              "#878A8D"
            ]
          ,
          'circle-opacity': 
          [
            "interpolate",
            ["linear"],
            ["zoom"],
            14.5,
            0,
            15,
            1
          ]
        },
        filter: [
          "match",
            ["geometry-type"],
            ["Point"],
            true,
            false
        ],
      }
      ,
      "areas-5vn8jf" // bottom layer. FIXME: use a layer name that won't break.
      );

      that.map.addLayer({
        'id': 'problem-symbols',
        'type': 'symbol',
        'source': 'problems',
        'source-layer': 'problems-ayes3a',
        'minzoom': 19,
        'layout': {
          // Make the layer visible by default.
          'visibility': 'visible',
          'text-allow-overlap': true,
          'text-field': [
            "to-string",
            ["get", "circuitNumber"]
          ],
          'text-size': [
            "interpolate",
            ["linear"],
            ["zoom"],
            19,
            10,
            22,
            20
          ],
          // 'text-font': [
          //   'Open Sans Bold',
          //   'Arial Unicode MS Regular'
          // ],
        },
        'paint': {
          // 'text-opacity': [
          //   "step",
          //   ["zoom"],
          //   0,
          //   18,
          //   0,
          //   19,
          //   1
          // ],
          'text-color': 
          // '#f5f5f5'
            [
              "case",
                [
                  "match",
                  ["get", "circuitColor"],
                  ["", "white"],
                  true,
                  false
                ],
                "#333",
                "#fff",
            ]
          ,
        },
        filter: [
          "match",
            ["geometry-type"],
            ["Point"],
            true,
            false
        ],
      });

      // that.map.setFilter('problems', [
      //   'match',
      //   ['get', 'grade'],
      //   ['4a', '4a+', '4b', '4b+', '4c', '4c+'],
      //   true,
      //   false
      // ]);
      
      if(this.hasBoundsValue) { 
        // console.log(this.boundsValue)
        let bounds = this.boundsValue

        this.map.fitBounds(
          [
            [bounds.south_west_lon, bounds.south_west_lat], // southwestern corner of the bounds
            [bounds.north_east_lon, bounds.north_east_lat] // northeastern corner of the bounds
          ], 
          {
            animate: true,
            padding: 50 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
          }
        );
      }


      if(this.hasProblemValue) { 
        let problem = this.problemValue

        this.map.flyTo({
          center: [problem.lon, problem.lat],
          zoom: 20,
          speed: 4,
          curve: 1,
          easing(t) {
          return t;
          }
        });

      // FIXME: make it DRY
        const coordinates = [problem.lon, problem.lat];
        const html = `<a href="/fr/redirects/new?problem_id=${problem.id}" target="_blank">${problem.name || ""} ${problem.grade}</a>`;
         
        new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]}) 
        .setLngLat(coordinates)
        .setHTML(html)
        .addTo(this.map);
      }



    });


    this.map.on('mouseenter', 'problems', () => {
      this.map.getCanvas().style.cursor = 'pointer';
    });
    this.map.on('mouseleave', 'problems', () => {
      this.map.getCanvas().style.cursor = '';
    });

    this.map.on('click', 'problems', (e) => {

      // console.log(e.features[0])
      // console.log(e.features[0].geometry)
      // var name = e.features[0].properties.name

      // FIXME: make it DRY
      const coordinates = e.features[0].geometry.coordinates.slice();
      const html = `<a href="/fr/redirects/new?problem_id=${e.features[0].properties.id})" target="_blank">${e.features[0].properties.name || ""} ${e.features[0].properties.grade}</a>`;
       
      new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]})
      .setLngLat(coordinates)
      .setHTML(html)
      .addTo(this.map);

      // window.location.href = "/fr/redirects/new?problem_id=" + e.features[0].properties.id;
    });

    // FIXME: make DRY
    this.map.on('mouseenter', 'pois-0bzt66', () => {
      if(this.map.getZoom() >= 12) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'pois-0bzt66', () => {
      if(this.map.getZoom() >= 12) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'pois-0bzt66', (e) => {
      if(this.map.getZoom() >= 12) {

        // console.log(e.features[0])
        // console.log(e.features[0].geometry)
        // var name = e.features[0].properties.name

        // FIXME: make it DRY
        const coordinates = e.features[0].geometry.coordinates.slice();
        const html = `<a href="${e.features[0].properties.googleUrl}" target="_blank">Voir sur Google</a>`;
         
        new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]})
        .setLngLat(coordinates)
        .setHTML(html)
        .addTo(this.map);
      }
    });

    // FIXME: make DRY
    this.map.on('mouseenter', 'areas-5vn8jf', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'areas-5vn8jf', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'areas-5vn8jf', (e) => {
      if(this.map.getZoom() < 15) {
        let props = e.features[0].properties
        this.map.fitBounds([
            [props.southWestLon, props.southWestLat], // southwestern corner of the bounds
            [props.northEastLon, props.northEastLat] // northeastern corner of the bounds
          ], 
          {
            // document.getElementById('map').clientWidth
            padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
          }
        );
      }
      
    });

     // FIXME: make DRY
    this.map.on('mouseenter', 'areas-hulls', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'areas-hulls', () => {
      if(this.map.getZoom() < 15) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'areas-hulls', (e) => {
      if(this.map.getZoom() < 15) {
        let props = e.features[0].properties
        console.log(props)
        this.map.fitBounds([
            [props.southWestLon, props.southWestLat], // southwestern corner of the bounds
            [props.northEastLon, props.northEastLat] // northeastern corner of the bounds
          ], 
          {
            padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
          }
        );
      }
    });

     // FIXME: make DRY
    this.map.on('mouseenter', 'clusters', () => {
      if(this.map.getZoom() <= 12) {
        this.map.getCanvas().style.cursor = 'pointer';
      }
    });
    this.map.on('mouseleave', 'clusters', () => {
      if(this.map.getZoom() <= 12) {
        this.map.getCanvas().style.cursor = '';
      }
    });

    this.map.on('click', 'clusters', (e) => {
      if(this.map.getZoom() <= 12) {
        let props = e.features[0].properties
        this.map.fitBounds([
            [props.southWestLon, props.southWestLat], // southwestern corner of the bounds
            [props.northEastLon, props.northEastLat] // northeastern corner of the bounds
          ], 
          {
            padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
          }
        );
      }
      
    });

  }

  gotoproblem(event) {
    // console.log(event.detail)

    this.map.flyTo({
      center: [event.detail.lon, event.detail.lat],
      zoom: 20,
      speed: 4,
      curve: 1,
      easing(t) {
      return t;
      }
    });

    // FIXME: make it DRY
      const coordinates = [event.detail.lon, event.detail.lat];
      const html = `<a href="/fr/redirects/new?problem_id=${event.detail.id}" target="_blank">${event.detail.name || ""} ${event.detail.grade}</a>`;
       
      new mapboxgl.Popup({closeButton:false, focusAfterOpen: false, offset: [0, -8]}) 
      .setLngLat(coordinates)
      .setHTML(html)
      .addTo(this.map);
  }

  gotoarea(event) {
    // console.log(event.detail)

    this.map.fitBounds([
        [event.detail.south_west_lon, event.detail.south_west_lat], // southwestern corner of the bounds
        [event.detail.north_east_lon, event.detail.north_east_lat] // northeastern corner of the bounds
      ], 
      {
        padding: 5 // careful: may trigger an error on mobile devices "Map cannot fit within canvas with the given bounds, padding, and/or offset."
      }
    );
  }
}