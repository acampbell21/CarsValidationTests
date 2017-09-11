require 'rails_helper'

RSpec.describe Car, type: :model do
  context 'with multiple cars' do
    describe '.by_model' do

      before(:each) do
        Car.create(make: 'bmw', model: '335i', age: '6', price: '17000', mileage: '115000', color: 'blue', interior: 'cloth')
        Car.create(make: 'rolls_royce', model: 'ghost', age: '1', price: '225000', mileage: '7000', color: 'white', interior: 'leather')
        Car.create(make: 'toyota', model: 'tundra', age: '4', price: '30000', mileage: '65000', color: 'grey', interior: 'leather')
      end

      it 'returns all cars by model ASC' do
        cars = Car.all.by_model
        expect(cars.first.model).to eq('335i')
        expect(cars[1].model).to eq('ghost')
        expect(cars.last.model).to eq('tundra')
      end

      it 'returns all cars by make ASC' do
        cars = Car.all.by_make
        expect(cars.first.make).to eq('bmw')
        expect(cars[1].make).to eq('rolls_royce')
        expect(cars.last.make).to eq('toyota')
      end

    end
  end

  context 'with multiple cars' do
    describe '.by_price' do

      before(:each) do
        Car.create(make: 'mercedes', model: 'S550', age: '3', price: '85000', mileage: '20000', color: 'black', interior: 'leather')
        Car.create(make: 'audi', model: 'RS7', age: '1', price: '125000', mileage: '12000', color: 'blue', interior: 'leather')
        Car.create(make: 'bmw', model: 'M5', age: '3', price: '80000', mileage: '25000', color: 'grey', interior: 'leather')
        Car.create(make: 'tesla', model: 'model s', age: '2', price: '100000', mileage: '90000', color: 'white', interior: 'leather')
      end

      it 'returns all cars by price ASC' do
        cars = Car.all.by_price
        expect(cars.first.price).to eq(80000)
        expect(cars[1].price).to eq(85000)
        expect(cars[2].price).to eq(100000)
        expect(cars.last.price).to eq(125000)
      end
    
    end

    describe '.by_age' do

      before(:each) do
        Car.create(make: 'mercedes', model: 'S550', age: '7', price: '85000', mileage: '20000', color: 'black', interior: 'leather')
        Car.create(make: 'audi', model: 'RS7', age: '6', price: '125000', mileage: '12000', color: 'blue', interior: 'leather')
        Car.create(make: 'bmw', model: 'M5', age: '3', price: '80000', mileage: '25000', color: 'grey', interior: 'leather')
        Car.create(make: 'tesla', model: 'model s', age: '9', price: '100000', mileage: '90000', color: 'white', interior: 'leather')
      end


    end
        


    
  end  

  context 'with a single car' do
    before(:each) do
      @car = Car.create(make: 'audi', model: 'a4', age: '4', price: '28000', mileage: '65000', color: 'white', interior: 'leather')
    end

    describe 'attributes' do
      it { should respond_to :make }
    end

    describe 'attributes' do
      it { should respond_to :color }
    end

    describe '#display_car' do
      it 'returns the car like <make> <model>' do
        expect(@car.display_car).to eq("#{@car.make} #{@car.model}")
      end
    end

    describe '#display_state' do
      it 'returns the car like <age> <mileage>' do
        expect(@car.display_state).to eq("#{@car.age} #{@car.mileage}")
      end
    end

    describe '#expensive?' do
      it 'returns the car like <price>' do
        expect(@car.expensive?).to eq(true)
      end
    end

  end




end
