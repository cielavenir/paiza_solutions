SELECT memory.id, memory.talk, person.name, battle.created_at FROM log
  JOIN memory ON memory.id = log.memory_id
  JOIN battle ON battle.person_id = log.person_id
  JOIN person ON person.id = log.person_id
  WHERE battle.created_at IN (SELECT deleted_at FROM person WHERE importance = 5);
