import React, { FC } from "react";
import { render, screen } from "@testing-library/react";
import { BrowserRouter } from "react-router-dom";

import Layout from "../../public/Layout";

import { AbilityContext, defineAbilityFor } from "../../../config/can";
import { client } from "../../../fixtures/user";

describe("Layout", () => {
  const ability = defineAbilityFor(client);

  it("should wrap a class component", () => {
    const MyComponent: FC = () => {
      return <p>My Component</p>;
    };
    render(
      <BrowserRouter>
        <AbilityContext.Provider value={ability}>
          <Layout>
            <MyComponent />
          </Layout>
        </AbilityContext.Provider>
      </BrowserRouter>
    );
    expect(screen.getByText("My Component")).toBeInTheDocument();
  });
});
