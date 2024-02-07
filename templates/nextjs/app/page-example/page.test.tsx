import { expect, test } from "vitest";
import { render, screen } from "@testing-library/react";
import Page from "./page";

test("App Router: page example rendering", () => {
  render(<Page />);
  expect(
    screen.getByRole("heading", { level: 1, name: "Page example" }),
  ).toBeDefined();
});
