SELECT Hell.id, Hell.name, Element.name AS element, Grade.name AS grade FROM Hell
  INNER JOIN Element ON Hell.element_id = Element.id
  INNER JOIN Grade ON Hell.grade_id = Grade.id
  WHERE Grade.name = "Boss" AND Element.id in (
    SELECT ElementCompatibility.weakness_element_id FROM Hell
      INNER JOIN Element ON Hell.element_id = Element.id
      INNER JOIN ElementCompatibility ON Element.id = ElementCompatibility.element_id
      WHERE Hell.name = "Graffiacane"
  );
