-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes
          (nome, lealdade)
VALUES
          ('Georgia', 0);

-- 2)

 INSERT INTO pedidos 
            (status, cliente_id)
        VALUES
          ('Recebido', 6);


-- 3)
                  INSERT INTO produtos_pedidos
          (pedido_id, produto_id)
        VALUES
          (6, 1),
          (6, 2),
          (6, 6),
          (6, 8),
          (6, 8);


-- Leitura

-- 1)
SELECT
  pedidos.*,
  produtos.*
FROM
  pedidos
JOIN clientes ON clientes.id = pedidos.id
JOIN produtos_pedidos ON produtos_pedidos.pedido_id = pedidos.id
JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE
clientes.nome LIKE 'Georgia';



-- Atualização

-- 1)

UPDATE clientes
SET lealdade = (SELECT SUM(produtos.pts_de_lealdade)
FROM produtos_pedidos
INNER JOIN pedidos  ON pedidos.cliente_id = produtos_pedidos.pedido_id
INNER JOIN clientes ON clientes.id = pedidos.cliente_id
INNER JOIN produtos ON produtos.id = produtos_pedidos.produto_id
WHERE clientes.nome ~ 'Georgia'
)
WHERE clientes.nome = 'Georgia';


-- Deleção

-- 1)

DELETE FROM clientes WHERE clientes.nome = 'Marcelo';

