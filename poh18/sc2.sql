SELECT Hell.id, Hell.name, Element.name AS element FROM Hell
  INNER JOIN Element ON Hell.element_id = Element.id
  WHERE Element.name = "Earth";
