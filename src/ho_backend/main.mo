import Token "mo:./Token";
import NFT "mo:./NFT";

actor Main {
  // Fungsi untuk mengambil saldo pengguna dari modul Token
  public query func get_balance(user: Principal) : async Token.Balance {
    return await Token.get_balance(user);
  };

  // Fungsi untuk mengirim token antar pengguna
  public func send_tokens(from: Principal, to: Principal, amount: Token.Balance) : async Bool {
    return await Token.send_tokens(from, to, amount);
  };

  // Fungsi untuk menginisialisasi saldo pengguna (untuk testing atau airdrop)
  public func initialize_balance(user: Principal, amount: Token.Balance) : async () {
    await Token.initialize_balance(user, amount);
  };

  // Fungsi untuk mint NFT
  public func mint_nft(owner: Principal, metadata: NFT.NFT_Metadata) : async NFT.NFT_ID {
    return await NFT.mint_nft(owner, metadata);
  };

  // Query untuk mendapatkan pemilik NFT
  public query func get_nft_owner(nft_id: NFT.NFT_ID) : async ?Principal {
    return await NFT.get_owner(nft_id);
  };

  // Query untuk mendapatkan metadata NFT
  public query func get_nft_metadata(nft_id: NFT.NFT_ID) : async ?NFT.NFT_Metadata {
    return await NFT.get_metadata(nft_id);
  };
}
