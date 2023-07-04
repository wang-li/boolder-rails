class CreateBleauAreas < ActiveRecord::Migration[7.0]
  def up
    create_table :bleau_areas do |t|
      t.string :slug, index: true, index: { unique: true }
      t.timestamps
    end

    slugs = ["cuvier","bellevue","campchailly","cuvierest","merveille","cuvier.nord","cuvierouest","rempart","sorcieres","piat","reconnaissance","montsetmerveilles","petitrempart","apremont","Apremontbelvedere","bizons","brulis","butteauxdames","butteauxpeintres","buvette","desert","envers","apremontest","fondgorges","hautdesgorges","biches","marietherese","apremontouest","portesdesert","apremontsanglier","solitude","apremontsully","cuisiniere","carnage","cretesud","bassesplaines","druides","ermitage","plaines","hautssablons","isatis","meyer","franchardpointdevue","raymond","sablons","franchardcarriers","sablons110","merisiers","houx","oiseauxdeproie","oiseauxproienord","petitparadis","renard","longboyau","aigu","cassepotgrises","cassepotoranges","cassepotroses","seineport","calvaire","calvaireest","petitmont","montchauvet","ussy","montussyest","hercule","canon","canonouest","germainest","germain","denecourt","guette","marecorneilles","marion","reclosescretes","recloses","restant","longrocherest","grottebeatrix","longrochergrandesvallees","restantsud","besnard","rocherbrule","avon","avonest","avonouest","bouligny","boulignyest","combe","occidentale","salamandreest","demoiselles","demoisellesest","demoisellessud","etroitures","princes","ventesheron","passage","montmorillon","fourceau","villecerf","beauregard","chaintreauville","darvault","fosse","troglodyte","mammouths","olivet","glandelles","petit","pierrelesault","puiseletimpasse","puiselet","sarrazin","sablibum","greau","pyrenees","cassepot","blomont","hyver","jouanne","elephant","boutdumonde","elephantnord","ouest","bernard","pentesmarchais","maunoury","montblancouest","montblanc","simonet","simonetouest","diable","argeville","boigneville","cailles","champlaid","chateaurenard","LeGoulot","leplaid","norgevaux","valleeeglise","canard","buthiersnord","y","tennis","marlanval","roisneau","villetard","91.1","95.2","95.2ouest","chateauveau","cul","chats","chatsnord","chatsouest","gros","cassis","jean","chambergeot","justicenoisy","segognole","pivot","poteau","four","oiseaux","sabots","sabotsest","zen","potets","souris","guetteur","hautsmilly","diplodocus","grandemontagne","martin","111","cailleau","cathedrale","tortue","general","mee","fin","guichot","boisdurocher","rond","boisrondauberge","moine","canche","anarchodrome","zinnen","beorlots","beorlotsnord","beorlotsouest","cornebiche","petitereine","reine","cretenord","milly","millyest","mariniers","telegraphe2","touche","valleechaude","charme","valleeronde","arcades","auvergne","grandesvallees","longsvaux","rochefeuilletee","coquibus","vendee","courances","coquibuswest","guichet","joncs","montignotte","montrougetouest","montrouget","rochequitourne","voleurs","ancetres","guinguette","hameau","loutteville","beauvais","rochesnoires","beauvaisest","telegraphe","charbonniere","valette","cheminroyal","hautepierre","grotteauxfees","padole","centmarches","moigny","noisy","oncynord","oncy","videlles_abbatoir","videlles","aiguille","ballancourt","montgriffard","boissylecutte","chamarande","belvedere","gillevoisin","croubis","champs","etampes","etrechy","buttesaintmartin","rocheplate","fertealais","pendu","sanglier","comble","maisse","mondevillecapavance","mondeville","mondevillerocheauxdames","billard","chatillon","mignot","prunay","valpuiseaux","villeneuve","maincourt","troche","vauxdecernay","orsay","merantais","angennes","saintremy"]

    slugs.each do |slug| 
      BleauArea.create(slug: slug)
    end
  end

  def down
    drop_table :bleau_areas
  end
end
