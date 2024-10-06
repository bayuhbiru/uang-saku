// NFT.mo

module {
  type NFT_ID = Nat;
  type NFT_Metadata = Text;

  // Map untuk menyimpan metadata NFT dan pemiliknya
  var nfts: TrieMap<NFT_ID, NFT_Metadata> = TrieMap.empty<NFT_ID, NFT_Metadata>();
  var owner_of: TrieMap<NFT_ID, Principal> = TrieMap.empty<NFT_ID, Principal>();

  var next_nft_id: NFT_ID = 1;

  // Fungsi untuk membuat (mint) NFT baru
  public func mint_nft(owner: Principal, metadata: NFT_Metadata) : async NFT_ID {
    let nft_id = next_nft_id;
    nfts.put(nft_id, metadata);
    owner_of.put(nft_id, owner);
    next_nft_id += 1;
    return nft_id;
  };

  // Query untuk mendapatkan pemilik NFT
  public query func get_owner(nft_id: NFT_ID) : async ?Principal {
    return owner_of.get(nft_id);
  };

  // Query untuk mendapatkan metadata NFT
  public query func get_metadata(nft_id: NFT_ID) : async ?NFT_Metadata {
    return nfts.get(nft_id);
  };
}
￼Enter
