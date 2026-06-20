class BankAccount {
  String ownerName;
  double _balance;
  String accountNumber;

  BankAccount(this.ownerName, this._balance, this.accountNumber);

  double get Balance => _balance;

  double Withdraw(double amount) {
    if (amount > Balance) {
      print("Invalid amount! Please try again");
    } else if (amount < 0) {
      print("Error amount! Please try again");
    } else {
      return amount;
    }

    double Credit(double amount) {
      if (amount) {
        amount += Balance._balance;
      }
    }
  }
}

class Bank {
  List<int> account = [];
  List<String> accountID = [];

  BankAccount createAccount(int accountId, String accountOwner){
    


  }
}
