SELECT memory.id, memory.talk, battle.result FROM log
  INNER JOIN memory ON memory.id = log.memory_id
  INNER JOIN battle ON battle.id = log.battle_id
  WHERE '2085-08-01' <= log.created_at AND log.created_at <= '2087-10-20';
