// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./IERC20.sol";

contract Market {

    enum FieldsStatus {
        Active,
        Sold,
        Cancelled
    }

    struct Fields {
        FieldsStatus status;
        address seller;
        address token;
        uint tokenId;
        uint price;
        uint tokneCount;
    }

    uint private _fieldsId = 0;
    mapping(uint => Fields) private _fields;

    // function to create the Fields by seller
    function listFields(address token, uint tokenId,uint price, uint tokenCount) external {

        require(tokenCount > 0,"");
        Fields memory fields = Fields(
            FieldsStatus.Active,
            msg.sender,
            token,
            tokenId,
            price,
            tokenCount
        );

        _fieldsId++;
        _fields[_fieldsId] = fields;
    }

    // function to buy token must be payable
    // to pass FieldsId the user tell us what he wont to buy
    function buyToken(uint fieldsId) external payable {

        Fields storage fields = _fields[fieldsId];

        require(msg.sender != fields.seller, "Buyer can not be a seller!!!");
        require(fields.status == FieldsStatus.Active,"Fields is not active");

        require(msg.value >= fields.price, "Insufficent payment");
    }

    function cancel(uint fieldsId) public {

        Fields storage fields = _fields[fieldsId];

        require(msg.sender == fields.seller, "only seller can cancelled listing");
        require(fields.status == FieldsStatus.Active,"Fields is not active");

        fields.status = FieldsStatus.Cancelled;

    }
}
