#!/usr/bin/env python3
import tkinter as tk
import time
import math

class GothicVibeClock(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Gothic Vibe Clock")
        self.geometry("350x400")
        self.configure(bg="#0d0d0d")        # deep gothic black
        self.overrideredirect(True)
        self.attributes("-topmost", True)

        # Canvas for the clock
        self.canvas = tk.Canvas(self, width=350, height=350, bg="#0d0d0d", highlightthickness=0)
        self.canvas.pack()

        # Digital time label
        self.time_label = tk.Label(
            self,
            font=("Cormorant Garamond", 22, "bold"),
            fg="#e0e0e0",
            bg="#0d0d0d"
        )
        self.time_label.pack(pady=5)

        self.center_window()
        self.start_time = time.time()
        self.update_clock()

    def center_window(self):
        self.update_idletasks()
        w, h = self.winfo_width(), self.winfo_height()
        ws, hs = self.winfo_screenwidth(), self.winfo_screenheight()
        x = (ws // 2) - (w // 2)
        y = (hs // 2) - (h // 2)
        self.geometry(f"{w}x{h}+{x}+{y}")

    def update_clock(self):
        elapsed = time.time() - self.start_time
        if elapsed >= 5:
            self.fade_out()
            return

        self.canvas.delete("all")
        t = time.localtime()
        h, m, s = t.tm_hour % 12, t.tm_min, t.tm_sec
        cx, cy, r = 175, 175, 120

        # Gothic clock face
        self.canvas.create_oval(cx-r, cy-r, cx+r, cy+r, outline="#e0e0e0", width=4)

        # Sword-like tapered hands with subtle shadows
        self.draw_hand(cx, cy, r*0.5, (h + m/60) * 30, 8, "#e0e0e0")  # hour
        self.draw_hand(cx, cy, r*0.7, m*6, 6, "#a0a0a0")               # minute
        self.draw_hand(cx, cy, r*0.9, s*6, 3, "#8B0000", shadow=True)  # second

        # Update digital time
        self.time_label.config(text=time.strftime("%H:%M:%S"))
        self.after(1000, self.update_clock)

    def draw_hand(self, cx, cy, length, angle_deg, width, color, shadow=False):
        """
        Draw a tapered sword-like hand with optional shadow.
        """
        angle = math.radians(angle_deg - 90)

        # Shadow effect
        if shadow:
            self._draw_triangle(cx+1, cy+1, length, angle, width+1, "#330000")

        self._draw_triangle(cx, cy, length, angle, width, color)

    def _draw_triangle(self, cx, cy, length, angle, width, color):
        """
        Helper function: draw a triangular tapered hand.
        """
        # tip point
        x_tip = cx + length * math.cos(angle)
        y_tip = cy + length * math.sin(angle)

        # base width perpendicular to angle
        offset = width / 2
        angle_left = angle + math.pi / 2
        angle_right = angle - math.pi / 2
        x1 = cx + offset * math.cos(angle_left)
        y1 = cy + offset * math.sin(angle_left)
        x2 = cx + offset * math.cos(angle_right)
        y2 = cy + offset * math.sin(angle_right)

        self.canvas.create_polygon(x1, y1, x2, y2, x_tip, y_tip, fill=color)

    def fade_out(self):
        alpha = self.attributes("-alpha") or 1.0
        alpha -= 0.05
        if alpha <= 0:
            self.destroy()
        else:
            self.attributes("-alpha", alpha)
            self.after(50, self.fade_out)

if __name__ == "__main__":
    clock = GothicVibeClock()
    clock.mainloop()
