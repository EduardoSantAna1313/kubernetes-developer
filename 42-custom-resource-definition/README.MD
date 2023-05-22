Custom Resource Definitions são extensões que podemos fazer da api do kubernetes para criar e gerenciar recursos customizáveis.

O recurso declarado no arquivo `crd.yml` define um recurso que será usado da seguinte forma:

```yaml
kind: Internal
spec:
  internalLoad: "high"
  range: 1
  percentage: "2%"
``` 

Os tipos internalLoad, range e percentage são definidos no contrato do openApi presente no `crd.yml`.