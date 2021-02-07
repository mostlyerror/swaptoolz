motel = Motel.create!(
        name: 'Quality Inn',
        address: '15150 Brighton Rd, Brighton, CO 80601',
        phone: '+13036541400'
)

User.create!([
    {
        email: 'bpoon@codeforamerica.org',
        password: 'passw0rd',
        password_confirmation: 'passw0rd',
        motel: motel
    }
])