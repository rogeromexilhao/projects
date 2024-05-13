import tkinter as tk

class ScrollCounter:
    def __init__(self, root):
        self.root = root
        self.scroll_count = 0

        self.label = tk.Label(root, text="Scroll Count: 0", font=("Helvetica", 16))
        self.label.pack(pady=20)

        # Adicionando um evento de scroll para a janela
        root.bind("<MouseWheel>", self.scroll_event)

    def scroll_event(self, event):
        # Aumenta o contador de scroll sempre que um evento de scroll é detectado
        self.scroll_count += 1
        self.update_label()

    def update_label(self):
        # Atualiza o texto do rótulo para exibir o número atual de rolagens
        self.label.config(text="Scroll Count: {}".format(self.scroll_count))

if __name__ == "__main__":
    root = tk.Tk()
    root.title("Scroll Counter")
    app = ScrollCounter(root)
    root.mainloop()