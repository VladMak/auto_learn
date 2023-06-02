package main

import (
	"fmt"
	"math"
)

type Shape interface {
	Area() float32
}

type Square struct {
	sideLength float32
}

func (s Square) Area() float32 {
	return s.sideLength * s.sideLength
}

type Circle struct {
	radius float32
}

func (c Circle) Area() float32 {
	return float32(math.Pi) * c.radius * c.radius
}

func printShapeArea(s Shape) {
	fmt.Printf("Площадь фигуры: %.2f см \n", s.Area())
}

func main() {
	square := Square{10.5}
	circle := Circle{5.7}

	printShapeArea(square)
	printShapeArea(circle)
}