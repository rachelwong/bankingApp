# Banking terminal application

A small exercise practicing inheritance, object-oriented principles using Ruby.

Grateful to have received advice and guidance from instructor Matthew Stubbs at Coder Academy.

### Progress
`bankaccount.rb`: Version 1 with no use of classes, objects

`bankapp2.rb`: An improvement upon version 1 using one primitive class structure 

`bankapp_classObj.rb`: Used objects and classes to separate between user input, feedback screens and account functionalities 

### Minimal Viable Product features
- Read from a text file for user authentication
- Deposit, withdrawal, view balance functions
- Basic error handling (no negative values, no string input)

### Extensible Features
- Create a KidsAccount class based on the parent Account object
- Persistent data (record history of balance activity)

### Key Learnings
An object can be passed into another method of another class

Use a trigger method to start the program `start`

### Gems
- [IO-Console](https://github.com/ruby/io-console) for 'press any key to continue' function 
