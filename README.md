# Upload-DB-and-Poker-SQL-queries  
  This repository contains SQL queries and instructions for uploading a local database and using SQL queries to perform data analysis on real customer results from an online poker platform. The provided queries aim to answer specific questions related to customer activity and profitability.  
  
  
<b>Prerequisites:</b>   
  1. A MySQL server installed and running;
  •	A MySQL server installed and running;  
  •	MySQL client (such as MySQL Workbench, which I prefer, or command-line client) for executing the queries;  
  •	The provided CSV files (customer.csv and result.csv), which are available on “Datasets” file on this repository, containing the necessary data to populate the tables.  

<b>Setup and Usage:</b>  
1.	Create a new database (I named 'sqlgithub1');
2.	Create the customer table to store customer information;
3.	Load the data from the customer.csv file into the customer table;
4.	Create the result table to store poker game results;
5.	Load the data from the result.csv file into the result table;
6.	a) Calculate the rake generated by each generation of players based on their birth year;
7.	b) Calculate the total rake generated per month;
8.	c) Calculate the proportion of winners by gender and orders the results by the winners' proportion in descending order.
   
Given two “.csv” files, containing:  

Table ‘resultado’:  
  Data_acesso: the day the player executed the actions.  
  Clientes_id: customer’s id, this column can be used to fetch the information of the customer table.  
  Buyin: total amount bet by the player.  
  Winning: total amount won by the player (when negative, the player's total loss).  
  Rake: the company's profit from this player.  

Table ‘clientes’:  
  Id: customer's id. Can be crossed with the customer_id information in the result table.  
  Sexo: player's gender (being m=male and f=female).  
  Data_nascimento: year, month and day of birth of the player.  
  Data_cadastro: date and time when the player registered.  
  Cidade: city where the player lives.  
  Sigla: UF (“Federative Unity”, in Brazil is the same as “state”) where the player lives.    

Considering these tables, I answered the following questions using SQL:  
  a. How much rake was generated by each Generation* of players?  
  b. What was the rake generated per month?  
  c. Which gender has a higher proportion of Winners**?  

*I considered that each generation follows these criteria:  
  • Veterans: people born between 1925 and 1940.  
  • Baby Boomers: born between 1941 and 1959.  
  • Generation X: born between 1960 to 1979.  
  • Generation Y: born between 1980 and 1995.  
  • Generation Z: born between 1996 to 2010.  
  • Alpha Generation: those born from 2010 to the present date.  

**As a “winner”, I considered a player with “Winning” greater than 0.

Contributions are welcome. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.  

MIT License.
