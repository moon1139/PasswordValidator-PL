use strict;
use warnings;

sub has_mixed_case_letters {
    my ($password) = @_;
    return $password =~ /[a-z]/ && $password =~ /[A-Z]/;
}

sub has_numbers {
    my ($password) = @_;
    return $password =~ /[0-9]/;
}

sub has_symbols {
    my ($password) = @_;
    return $password =~ /[\W_]/;
}

sub is_valid_password {
    my ($password) = @_;
    my $length = length($password);

    return "Invalid: Password must be at least 8 characters long" if $length < 8;

    if ($length >= 8 && $length <= 11) {
        return "Valid" if has_mixed_case_letters($password) && has_numbers($password) && has_symbols($password);
        return "Invalid: Password must contain mixed case letters, numbers, and symbols";
    }
    elsif ($length >= 12 && $length <= 15) {
        return "Valid" if has_mixed_case_letters($password) && has_numbers($password);
        return "Invalid: Password must contain mixed case letters and numbers";
    }
    elsif ($length >= 16 && $length <= 19) {
        return "Valid" if has_mixed_case_letters($password);
        return "Invalid: Password must contain mixed case letters";
    }
    else {
        return "Valid";
    }
}

# Testing
my $password = '1234';
print $password . " is " . is_valid_password($password) . "\n"; #Invalid

$password = '12345678';
print $password . " is " . is_valid_password($password) . "\n"; #Invalid

$password = '1234567890AB';
print $password . " is " . is_valid_password($password) . "\n"; #Invalid

$password = '1234567890Ab';
print $password . " is " . is_valid_password($password) . "\n"; #Valid

$password = '1234567890123456';
print $password . " is " . is_valid_password($password) . "\n"; #Invalid

$password = '1234567890123456Ab';
print $password . " is " . is_valid_password($password) . "\n"; #Valid

$password = '12345678901234567890';
print $password . " is " . is_valid_password($password) . "\n"; #Valid