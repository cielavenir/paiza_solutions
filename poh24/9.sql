SELECT memory.id, memory.talk FROM memory
  INNER JOIN category ON category.id = memory.category_id
  WHERE memory.importance >= 3 AND category.name = '悲しみ';
