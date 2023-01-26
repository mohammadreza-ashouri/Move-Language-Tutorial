
// Author: Mohammadreza Ashouri <ashourics@gmail.com>
// web: https://ashoury.net
// contact: ashourics@gmail.com

// This module shows an example of how to declare main objects for a forum or social media 
// how to use String in Move
// how to unit-test your move code!

module 0x1::SuiHubForum{
   
    use std::vector;
    use std::debug; // debugging the code and using consol!
    // user struct represent users profile
    /*
    
    bio: Bio max length 65 chars
    NFT url => image 
    username 
    email
    WALLET PAIR
    phone

    */
// store=> storage memory of Sui

    struct User has store,key,drop {

        id: u64,
        username: vector<u8>, // vector<u8> -> string in the native level 
        email: vector<u8>,
        phone: u64,
        nftUrl: vector<u8>,
        walletAddress: address,
        verified: bool

    }
 // key ->, which allows the object to be persisted in Sui's global storage.

    struct Empty {}
    


    public fun new_user(id: u64, username: vector<u8>, email: vector<u8>, phone: u64, nftUrl: vector<u8>, walletAddress:address, verified: bool): User {
        User {
            id,
            username,
            email,
            phone,
            nftUrl,
            walletAddress,
            verified
        }
    }

    public fun id(user: User): u64 {
        user.id
    }


    struct Friends has drop,store, key{
        community: vector<User>
    }

    public fun create_friend(friend: User,&mut friends) : User{
        // &mut -> so we can alter the friends in side of the function it is mutable now
        let newFriend = User {
            username: friend.username
            email: friend.email
        }

        add_friend(newFriend, friends);
        return newFriend
    }

    public fun add_friend(_user: User, friends: &mut Friends){
        vector::push_back(&mut friends.community, _user)
    }


    #[test]
    fun test_create_community() {
        let mo= User {
            username: b"Mohammadreza", //-->string using vector<u8>
            email: b"ashourics@gmail.com",
        }
    }
}


