pragma solidity 0.4.23;
// pragma experimantal ABIEncoderV2;

contract Team {
    struct Member {
        string name;
    }

    // create public mapping that maps member id (uint) to a Member
    mapping (uint => Member) public members;

    // create setMember for adding a new member that accepts _id, and _name as arguments
    function setMember(uint _id, string _name) public {
        members[_id] = Member(_name);
    }

    // create getMemberName that returns name of the member by id
    function getMemberName(uint _id) public view returns (string) {
        return members[_id].name;
    }

    // create removeMember that "removes" member by id
    function removeMember(uint _id) public {
        delete members[_id];
    }
}
