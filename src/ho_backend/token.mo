// Token.mo

module {
  type Balance = Nat;

  // Map untuk menyimpan saldo pengguna
  var balances: TrieMap<Principal, Balance> = TrieMap.empty<Principal, Balance>();

  // Fungsi untuk mengambil saldo pengguna
  public func get_balance(user: Principal) : async Balance {
    return switch (balances.get(user)) {
      case (?balance) balance;
      case null 0;
    };
  };

  // Fungsi untuk mengirim token antar pengguna
  public func send_tokens(from: Principal, to: Principal, amount: Balance) : async Bool {
    let from_balance = await get_balance(from);
    if (from_balance >= amount) {
      balances.put(from, from_balance - amount);
      let to_balance = await get_balance(to);
      balances.put(to, to_balance + amount);
      return true;
    } else {
      return false;
    };
  };

  // Fungsi untuk menginisialisasi saldo pengguna (digunakan untuk testing atau airdrop)
  public func initialize_balance(user: Principal, amount: Balance) : async () {
    balances.put(user, amount);
  };
}
