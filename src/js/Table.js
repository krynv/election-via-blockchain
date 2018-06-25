import React, { Component } from 'react';

class Table extends Component {
    render() {
        return (
            <table className='table'>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Votes</th>
                    </tr>
                </thead>
                <tbody >
                    {this.props.candidates.map((candidate) => {
                        return (
                            <tr>
                                <th>{candidate.id.toNumber()}</th>
                                <td>{candidate.name}</td>
                                <td>{candidate.voteCount.toNumber()}</td>
                            </tr>
                        )
                    })}
                </tbody>
            </table>
        )
    }
}

export default Table;