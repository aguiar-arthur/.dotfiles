import fortune
import cowsay


def get_fortune() -> str:
    fortune_sentence = fortune.get_random_fortune("data/activists")
    print(cowsay.cow(fortune_sentence))


if __name__ == "__main__":
    get_fortune()
