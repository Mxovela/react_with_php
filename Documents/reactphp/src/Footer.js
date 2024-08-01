import React from "react";

function Footer(){
    return(
        <React.Fragment>
            <footer className="bg-dark fixed-bottom">
                <div className="container">
                    <div className="row">
                        <div classname="col-md-6 mt-3">
                            <p className="text-center text-white">Copyright &copy; 2024 Mxovela</p>
                        </div>
                    </div>
                </div>
            </footer>
        </React.Fragment>
    );
}

export default Footer;