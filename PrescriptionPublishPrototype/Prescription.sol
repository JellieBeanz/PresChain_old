pragma solidity 0.5.11;

import "./Ownable.sol";


contract Prescription is Ownable{
    
    struct Drug{
        string drugName;
        string dosage;
    }
    
    Drug[] drugsonpres;
    
    function addDrug(string memory _drugname, string memory _dosage)  public onlyDoctor{
        Drug memory d1;
        d1.drugName = _drugname;
        d1.dosage = _dosage;
        drugsonpres.push(d1);
    }
     function getDrugnName(uint _index) public view returns(string memory){
         return drugsonpres[_index].drugName;
     }
     function getDrugDosage(uint _index) public view returns(string memory){
         return drugsonpres[_index].dosage;
     }
     
    
}