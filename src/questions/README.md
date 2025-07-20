# Módulo de Perguntas

Este módulo gerencia o cadastro, consulta, atualização e remoção de perguntas (QuestionItem) no sistema.

## Rotas Disponíveis

### POST /questions
Cria uma nova pergunta.

**Body:**
```json
{
  "textMd": "Enunciado da pergunta em Markdown",
  "contextMd": "Contexto da pergunta em Markdown",
  "commandMd": "Comando da pergunta em Markdown",
  "difficulty": "MEDIO", // FACIL, MEDIO, DIFICIL
  "capabilityId": 1, // ID da capacidade (opcional)
  "capabilitySaepId": 1, // ID da capacidade SAEP (opcional)
  "functionId": 1, // ID da função (opcional)
  "subFunctionId": 1, // ID da subfunção (opcional)
  "performanceStandardId": 1, // ID do padrão de desempenho (opcional)
  "knowledgeIds": [1, 2, 3], // IDs dos conhecimentos (opcional)
  "alternatives": [
    {
      "textMd": "Texto da alternativa em Markdown",
      "isCorrect": true,
      "attachments": [
        {
          "type": "IMAGE",
          "url": "caminho/para/imagem.jpg",
          "captionMd": "Legenda da imagem",
          "order": 0
        }
      ]
    }
  ],
  "attachments": [
    {
      "type": "IMAGE",
      "url": "caminho/para/anexo.jpg",
      "captionMd": "Legenda do anexo",
      "order": 0
    }
  ]
}
```

### GET /questions
Lista todas as perguntas.

**Query Parameters:**
- `capabilityId`: Filtra por capacidade
- `difficulty`: Filtra por dificuldade (FACIL, MEDIO, DIFICIL)

### GET /questions/:id
Busca uma pergunta específica por ID.

### PATCH /questions/:id
Atualiza uma pergunta existente.

**Body:** Mesmo formato do POST, mas todos os campos são opcionais.

### DELETE /questions/:id
Remove uma pergunta.

## Estrutura de Dados

### QuestionItem
- `id`: ID único da pergunta
- `textMd`: Enunciado em Markdown
- `contextMd`: Contexto em Markdown
- `commandMd`: Comando em Markdown
- `difficulty`: Dificuldade (FACIL, MEDIO, DIFICIL)

### Alternative
- `id`: ID único da alternativa
- `textMd`: Texto da alternativa em Markdown
- `isCorrect`: Se é a resposta correta
- `questionItemId`: ID da pergunta

### Attachment
- `id`: ID único do anexo
- `type`: Tipo do anexo (IMAGE, CODE, FILE, etc.)
- `url`: Caminho ou URL do arquivo
- `captionMd`: Legenda em Markdown
- `order`: Ordem de exibição
- `questionItemId`: ID da pergunta (opcional)
- `alternativeId`: ID da alternativa (opcional)

## Relacionamentos

Uma pergunta pode estar relacionada a:
- Capacidade (Capability)
- Capacidade SAEP (CapabilitiesSaep)
- Função (Functions)
- Subfunção (SubFunction)
- Padrão de Desempenho (PerformanceStandard)
- Múltiplos Conhecimentos (Knowledge)

## Exemplo de Uso

```bash
# Criar uma pergunta
curl -X POST http://localhost:3000/questions \
  -H "Content-Type: application/json" \
  -d '{
    "textMd": "Qual é a capital do Brasil?",
    "contextMd": "Considere a geografia brasileira",
    "commandMd": "Selecione a alternativa correta",
    "difficulty": "FACIL",
    "alternatives": [
      {
        "textMd": "São Paulo",
        "isCorrect": false
      },
      {
        "textMd": "Brasília",
        "isCorrect": true
      },
      {
        "textMd": "Rio de Janeiro",
        "isCorrect": false
      }
    ]
  }'

# Listar todas as perguntas
curl http://localhost:3000/questions

# Buscar pergunta por ID
curl http://localhost:3000/questions/1

# Filtrar por dificuldade
curl http://localhost:3000/questions?difficulty=FACIL

# Filtrar por capacidade
curl http://localhost:3000/questions?capabilityId=1
``` 