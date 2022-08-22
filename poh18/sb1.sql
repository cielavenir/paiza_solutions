SELECT Hell.id, Hell.name, Element.name AS element, Grade.name AS grade FROM Hell
  INNER JOIN Element ON Hell.element_id = Element.id
  INNER JOIN Grade ON Hell.grade_id = Grade.id
  WHERE Element.name = "Air" AND Grade.name = "Boss";
