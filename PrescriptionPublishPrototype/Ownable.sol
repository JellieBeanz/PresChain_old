pragma solidity 0.5.11;

contract Ownable{
    
    //Array of all owners to contract
    address[] owners;
    //Doctors address
    address public doctor;
    //Pharmacy's address
    address public pharmacy;
    //Current owner
    address public owner;
    //Amount of times the contract can be transacted
    uint transactionLimit = 2;
    //amount of transactions on current contract
    uint transactions;
    
    
    //Only doctor modifier
    modifier onlyDoctor(){
        require(msg.sender == doctor,'This account is not the Doctor');//returns error message
        _;
    }
    //only Owner modifier
    modifier onlyOwner(){
        require(msg.sender == owner,'This account is not the owner');//returns error message
        _;
    }
    //Class Constructor
    constructor() public{
        owner = msg.sender;
        owners.push(owner);
        doctor = owners[0];
    }
    
    //Trading function takes new address and sets to newOwner, only owner can activate this function
    function transferOwnership(address newOwner) public onlyOwner{
        //require that the owner is not sending to their own address
        require(newOwner != owner,'Owner already owns Contract');//returns error message
            //checks that there are still allowable transactions
            require(transactions < transactionLimit,'Transaction limit reached');//returns error message
                //make sure new owner is not null
                require (newOwner != address(0));
                //set newOwner as owner
                owner = newOwner;
                //increase transactions on contract
                transactions = transactions +1;
                //add new owner to array
                owners.push(newOwner);
                if(transactions == transactionLimit){
                    pharmacy = owners[2];
            }
        
    }

}