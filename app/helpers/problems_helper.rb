module ProblemsHelper
	def circle_view(problem)
    content_tag(:div, problem.circuit_number.presence || "&nbsp;".html_safe, 
      style: "background: #{uicolor(problem.circuit&.color)}; color: #{text_color(problem.circuit&.color)}",
      class: "circle_view")
	end

	def circle_view_with_name(problem)
		content_tag(:span, circle_view(problem), class: "mr-1") + 
			(link_to (problem.name.presence || "No name"), edit_problem_path(problem))
	end

	def uicolor(circuit_color)
		color_mapping[circuit_color] || "#CCC"
	end

	private
	def color_mapping
		 {
			yellow: 	"#FFCC02",
			orange: 	"#FF9500",
			blue: 		"#017AFF",
			skyblue: 	"#5AC7FA",
			red: 			"#FF3B2F",
			black: 		"#000000",
			white: 		"#FFFFFF",
		}.with_indifferent_access
	end

	def text_color(circuit_color)
		if circuit_color.to_s == "white"
			"#000"
		else
			"#FFF"
		end
	end
end
