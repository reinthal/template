import matplotlib.pyplot as plt
import numpy as np


def create_figure():
    # Create sample data
    x = np.linspace(0, 10, 100)
    y = np.sin(x)

    # Create the figure
    plt.figure(figsize=(8, 6))
    plt.plot(x, y, "b-", label="sin(x)")
    plt.title("Example Sine Wave")
    plt.xlabel("x")
    plt.ylabel("sin(x)")
    plt.grid(True)
    plt.legend()

    # Save the figure
    plt.savefig("figures/hello.pdf")
    plt.close()


def main():
    create_figure()


if __name__ == "__main__":
    main()
