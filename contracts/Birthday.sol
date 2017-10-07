pragma solidity 0.4.15;

contract Birthday {
   struct User {
      uint256 amount,
      uint256 date
   }

   /// @notice Main function to set a time to receive the ether
   /// @param _date When is your next birthday. Must be less than 1 year
   function birthday(uint256 _date) payable {
      require(_date > now);
      require(_date - now <= 1 years);

      balances[msg.sender].amount = msg.value;
      balances[msg.sender].date = _date;
   }

   /// @notice To check if the time of the birthday has come. Must be called by the owner
   function checkBirthday() {
      if(balances[msg.sender].date >= now) {
         msg.sender.transfer(balances[msg.sender].amount);
      }
   }
}
