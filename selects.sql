-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT
  pedidos.*,
  produtos.*
FROM
  pedidos
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id;
-- 2)
SELECT
  pedidos.id
FROM
  pedidos
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE
produtos.nome LIKE 'Fritas';
-- 3)
SELECT
  clientes.nome gostam_de_fritas
FROM
  pedidos
JOIN clientes ON clientes.id = pedidos.id
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE
produtos.nome LIKE 'Fritas';

-- 4)
SELECT
  sum(produtos.preço)
FROM
  pedidos
JOIN clientes ON clientes.id = pedidos.id
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE
clientes.nome LIKE 'Laura';
-- 5)
SELECT
  produtos.nome,
  COUNT(produtos.id)
FROM
  pedidos
JOIN produtos_pedidos
ON pedidos.id = produtos_pedidos.pedido_id
JOIN produtos
ON produtos.id = produtos_pedidos.produto_id
GROUP BY
produtos.nome 
ORDER BY
produtos.nome;