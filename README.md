# Tech Test: Bank

## Description
This project was set out by Makers as an example tech tests. It is a functioning bank account, where you can deposit and withdraw money, and then choose to view a formatted statement with your transaction history. This statement will consist of the date of transaction, whether it's credit or debit, and then the remaining balance after that transaction.

## Installation
- Clone this repository
- ``` $ bundle install ```
- To see tests run ``` $ rspec ```
- To see detailed test coverage run ``` $ open coverage/index.html ```

## User Stories
As a user,  
So I can know how much money I have,  
I want to be able to view my balance.

As a user,  
So I can store my money,  
I want to be able to make deposits.  

As a user,  
So I can access my money,  
I want to be able to make withdrawals.  

As a user,  
So I can know my transaction history,  
I want to be able to view my bank statement.

As a user,
So I don't go under £0 and owe the bank money,  
I want to get an error if I try to withdraw below a balance of £0.

## Code Structure
I initially wanted four classes: ```Errors```, ```Time```, ```Bank```, ```Statement```. However, upon realising that ```Errors``` and 'Time' were small enough to simply include in the classes they were required in, these were removed. I then decided to add a separate ```Transactions``` class, in order to format the individual transaction into a form that can be added to the transaction log, also included in this class. This included adding whether it was credit or debit, and the date.

So, my final product consists of three classes, a more appropriately named ```Account``` class (with a deposit, withdraw and balance method, and error raising if necessary), a ```Transaction``` class (the function of which is explained above), and a ```Statement``` class. This ```Statement``` class joins the transaction log and formats it in the way that is required in order to view a reverse chronological and easy-to-read statement.

## Technologies Used
- ruby
- RSpec

## Dependencies
- rubocop: As a linter
- simplecov: For code coverage
- timecop: To mock time when testing

## Usage in IRB

![Screenshot 2020-01-28 at 14 22 01](https://user-images.githubusercontent.com/53044792/73272060-aaf34600-41d9-11ea-8f61-103e7ad18109.png)
