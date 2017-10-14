import CommandsCore

let commands = Commands()

do {
  try commands.run()
} catch let e as Commands.Error {
    print(e)
} catch {
    print("oh no, an unknown error was thrown 😱")
}

