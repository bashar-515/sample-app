import * as VIAM from "@viamrobotics/sdk";
import Cookies from "js-cookie";

let apiKeyId = "";
let apiKeySecret = "";

document.addEventListener("DOMContentLoaded", async () => {
  const robotNameDivId = "robot-name";

  const robotNameDiv: HTMLElement | null = document.getElementById(robotNameDivId);

  if (!robotNameDiv) {
    throw new Error(`Could not find HTML element with ID ${robotNameDivId}`);
  }

  let machineId = "";

  try {
    machineId = window.location.pathname.split("/")[2];

    ({ id: apiKeyId, key: apiKeySecret } = JSON.parse(Cookies.get(machineId)!));
    const robot = await (await connect()).appClient.getRobot(machineId);

    robotNameDiv.textContent = robot?.name ?? "Undefined";
  } catch (error) {
    console.log(error);

    robotNameDiv.textContent = "Could not retrieve robot. See console for more details";
  }
});

async function connect(): Promise<VIAM.ViamClient> {
  const opts: VIAM.ViamClientOptions = {
    serviceHost: "https://pr-8211-appmain-bplesliplq-uc.a.run.app/",
    credentials: {
      type: "api-key",
      authEntity: apiKeyId,
      payload: apiKeySecret,
    },
  };

  return await VIAM.createViamClient(opts);
}
