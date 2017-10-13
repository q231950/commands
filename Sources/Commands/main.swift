import CommandsCore

let commands = Commands()

do {
  try commands.run()
} catch {
  print("oh no 😱")
}

