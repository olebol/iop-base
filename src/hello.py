import iop
from dataclasses import dataclass


@dataclass
class HelloMessage(iop.PydanticMessage):
    text: str



class HelloOperation(iop.BusinessOperation):
    """Receives HelloMessage and logs it."""

    def on_message(self, request: HelloMessage):
        self.log_info(f"Received: {request.text}")
