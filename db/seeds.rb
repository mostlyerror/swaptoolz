ben = User.create!(
  email: 'bpoon@codeforamerica.org',
  password: 'password',
  password_confirmation: 'password',
)
ben.add_role :admin

fiona = User.create!(
  email: 'ftang@codeforamerica.org',
  password: 'password',
  password_confirmation: 'password',
)
fiona.add_role :admin

brandon = User.create!(
  email: 'bjohnson@codeforamerica.org',
  password: 'password',
  password_confirmation: 'password',
)
brandon.add_role :admin

nubia = User.create!(
  email: 'nubia@almosthome.org',
  password: 'password',
  password_confirmation: 'password',
)
nubia.add_role :operator


quality_inn = Motel.create!(
  name: 'Quality Inn',
  address: '15150 Brighton Rd, Brighton, CO 80601',
  phone: '+13036541400'
)

tanya = User.create!(
  email: 'tanya@qualityinn.com',
  password: 'password',
  password_confirmation: 'password',
)
tanya.add_role :front_desk, quality_inn
