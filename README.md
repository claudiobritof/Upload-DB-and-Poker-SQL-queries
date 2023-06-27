# Upload-DB-and-Poker-SQL-queries
  Uploading a local database and using SQL queries to answer questions related to customer results and profitability on a Online Poker Platform.


Given two “.csv” files, containing:

Table ‘resultado’:
  Data_acesso: the day the player executed the actions.
  Clientes_id: customer’s id, this column can be used to fetch the information of the customer table.
  Buyin: total amount bet by the player.
  Winning: total amount won by the player. When negative, the player's total loss.
  Rake: the company's profit from this player.

Table ‘clientes’:
  Id: customer's id. Can be crossed with the customer_id information in the result table.
  Sexo: player's gender, being m=male and f=female.
  Data_nascimento: year, month and day of birth of the player.
  Data_cadastro: date and time when the player registered.
  Cidade: city where the player lives.
  Sigla: UF (“Federative Unity”, in Brazil is the same as “state”) where the player lives.

Considering these tables, the following questions will be answered using SQL:
