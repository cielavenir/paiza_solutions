SELECT Players.id AS id, SUM(Items.damage*Inventories.count) AS inventory_sum_damage FROM Inventories
  INNER JOIN Players ON Players.id = Inventories.user_id
  INNER JOIN Items ON Items.id = Inventories.item_id
  GROUP BY Players.id;
