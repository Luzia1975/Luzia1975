openapi: 3.1.0
info:
  title: LuzIA Skills API
  version: 1.0.0
  description: API completa para listar, filtrar e cadastrar skills terapêuticas.

servers:
  - url: https://mocki.io/v1

paths:
  /skills:
    get:
      operationId: getAllSkills
      summary: Lista todas as skills
      responses:
        "200":
          description: Lista de todas as skills
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Skill'
    post:
      operationId: createSkill
      summary: Cria uma nova skill
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/Skill'
      responses:
        "201":
          description: Skill criada com sucesso

  /skills/filter:
    get:
      operationId: getSkillsByTrigger
      summary: Lista skills filtradas por trigger
      parameters:
        - name: trigger
          in: query
          required: true
          schema:
            type: string
      responses:
        "200":
          description: Lista de skills com gatilho
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/Skill'

components:
  schemas:
    Skill:
      type: object
      required:
        - name
        - description
        - triggers
      properties:
        name:
          type: string
        description:
          type: string
        triggers:
          type: array
          items:
            type: string
