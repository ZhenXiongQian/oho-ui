export class Position {
  x: string
  y: string

  constructor(x: string, y: string) {
    this.x = x
    this.y = y
  }

  setValue(x: string, y: string) {
    this.x = x
    this.y = y
  }

  toString(): string {
    return `x: ${this.x}, y: ${this.y}`
  }
}

export class DisplayPosition {
  position: Position
  width: string
  height: string

  constructor(x: string, y: string, width: string, height: string) {
    this.position = new Position(x, y)
    this.width = width
    this.height = height
  }

  setValue(x: string, y: string, width: string, height: string) {
    this.position.setValue(x, y)
    this.width = width
    this.height = height
  }

  toString(): string {
    return `${this.position.toString()}, width: ${this.width}, height: ${this.height}`
  }
}