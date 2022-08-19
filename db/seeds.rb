# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1=User.create(name: 'XYZ', email: 'admin@gmail.com',password: 'password',password_confirmation: 'password')
u2=User.create(name: 'Customer 1', email: 'customer1@gmail.com',password: 'password',password_confirmation: 'password')
u3=User.create(name: 'Customer 2', email: 'customer2@gmail.com',password: 'password',password_confirmation: 'password')
c1=Company.create(name:"SBI Life",description: 'SBI Life is a long-term life insurance provider with its headquarters in Mumbai, offering individual and group insurance.')
p1=Poltype.create(name: "Retirement Plan",description: 'These investment plans allow you to systematically save money over the years so that you can enjoy a steady income once you retire.', company_id: c1.id, duration: 20, sum_insured: 3000000, premium_amount:3000)
c2=Company.create(name:"Bajaj Allianz",description: 'Leading Insurance Company in India Offering Health, Car, Two Wheeler and Travel Insurance.')
p2=Poltype.create(name: "Term Life Insurance",description: 'A term insurance plan is a pure protection plan that offers a life cover to the policyholder in return for timely premium payments.', company_id: c2.id, duration: 25, sum_insured: 500000, premium_amount:5000)
c3=Company.create(name:"HDFC Life",description: 'HDFC Life is a leading provider of comprehensive life insurance products and services in India.')
p3=Poltype.create(name: "Whole Life Insurance",description: 'Whole Life Insurance is a comprehensive insurance policy that provides a comprehensive coverage for the whole life of the insured.', company_id: c3.id, duration: 30, sum_insured: 1000000, premium_amount:10000)
c4=Company.create(name:"Reliance Life Insurance",description: 'Reliance Life Insurance is a leading provider of comprehensive life insurance products and services in India.')
p4=Poltype.create(name: "Critical Illness Insurance",description: 'Critical Illness Insurance is a comprehensive insurance policy that provides a comprehensive coverage for the whole life of the insured.', company_id: c4.id, duration: 35, sum_insured: 1500000, premium_amount:15000)
c5=Company.create(name:"ICICI Prudential Life Insurance",description: 'ICICI Prudential Life Insurance is a leading provider of comprehensive life insurance products and services in India.')
p5=Poltype.create(name: "Accidental Death & Dismemberment Insurance",description: 'Accidental Death & Dismemberment Insurance is a comprehensive insurance policy that provides a comprehensive coverage for the whole life of the insured.', company_id: c5.id, duration: 40, sum_insured: 2000000, premium_amount:20000)
