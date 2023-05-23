Exemplo de implementação de Canary deploy.

Temos um deployment com 3 replicas do App na versão v1.

Temos um service que expoe os recursos com a label `app:frontend`. Inicialmente apenas os 3 pods do deployment da v1 são expostos.

Criado novo deployment v2, com a mesma label `app:frontend` porém com apenas 1 replica. Assim teremos 4 pods rodando. 3 pods da v1 e mais um pod com a v2. O service irá apontatar para os 4 pods e irá distribuir a carga, portanto a versão 2 do nosso App receberá 25% da carga, enquanto a versão 1 receberá 75%.

Para redistribuir a carga basta realizar um scale no deployment da v1 ou da v2.

Quando a versão 2 estiver bem estabelecida, podemos setar as replicas da versão 1 para zero.

Após algum tempo, enfim, podemos excluir o deployment da versão 1.