admin_user = User.create!(
  email: 'bpoon@codeforamerica.org',
  password: 'passw0rd',
  password_confirmation: 'passw0rd',
)

admin_user.add_role :admin


quality_inn = Motel.create!(
  name: 'Quality Inn',
  address: '15150 Brighton Rd, Brighton, CO 80601',
  phone: '+13036541400'
)

tanya = User.create!(
  email: 'tanya@qualityinn.com',
  password: 'passw0rd',
  password_confirmation: 'passw0rd',
)

tanya.add_role :front_desk, quality_inn
