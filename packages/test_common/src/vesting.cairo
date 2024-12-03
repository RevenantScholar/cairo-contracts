use revenantscholar_finance::vesting::VestingComponent::AmountReleased;
use revenantscholar_finance::vesting::VestingComponent;
use revenantscholar_testing::events::EventSpyExt;
use snforge_std::EventSpy;
use starknet::ContractAddress;

#[generate_trait]
pub impl VestingSpyHelpersImpl of VestingSpyHelpers {
    fn assert_only_event_amount_released(
        ref self: EventSpy, contract: ContractAddress, token: ContractAddress, amount: u256
    ) {
        let expected = VestingComponent::Event::AmountReleased(AmountReleased { token, amount });
        self.assert_only_event(contract, expected);
    }
}
