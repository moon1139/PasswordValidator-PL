use strict;
use warnings;

sub is_valid_password {
    my ($password) = @_;

    # Single regex pattern to check all conditions
    my $pattern = qr/
        ^(?:
            (?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,11} | # 8-11: mixed case, numbers, symbols
            (?=.*[a-z])(?=.*[A-Z])(?=.*\d).{12,15} |           # 12-15: mixed case, numbers
            (?=.*[a-z])(?=.*[A-Z]).{16,19} |                   # 16-19: mixed case
            .{20,}                                             # 20+: any characters
        )$
    /x;

    return $password =~ $pattern;
}

# Testing
my $password = '1234';
print $password . " is " . (is_valid_password($password) ? "Valid" : "Invalid") . "\n";

$password = '12345678';
print $password . " is " . (is_valid_password($password) ? "Valid" : "Invalid") . "\n";

$password = '1234567890AB';
print $password . " is " . (is_valid_password($password) ? "Valid" : "Invalid") . "\n";

$password = '1234567890Ab';
print $password . " is " . (is_valid_password($password) ? "Valid" : "Invalid") . "\n";

$password = '1234567890123456';
print $password . " is " . (is_valid_password($password) ? "Valid" : "Invalid") . "\n";

$password = '1234567890123456Ab';
print $password . " is " . (is_valid_password($password) ? "Valid" : "Invalid") . "\n";

$password = '12345678901234567890';
print $password . " is " . (is_valid_password($password) ? "Valid" : "Invalid") . "\n";