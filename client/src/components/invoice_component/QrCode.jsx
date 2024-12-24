import axios from "axios";
import { useEffect, useState } from "react";
import { API_URL } from "../../config/config";

const QrCode = ({totalSum,upi}) => {
    const jwt_token = sessionStorage.getItem("token");
    const [imageSrc, setImageSrc] = useState('');

    const fetchImage = async () => {
        try {
            // send-email/generateQR
            const response = await axios.post(`${API_URL}invoice/qr_code/generateQR`,{totalSum:totalSum,upi:upi},{
                headers:{
                    Authorization: `Bearer ${jwt_token}`
                }
            });
            // console.log(response.data);
            setImageSrc(response.data); // Replace 'image_url' with the actual property name
        } catch (error) {
            console.error('Error fetching image:', error);
        }
    };
    useEffect(() => {
        fetchImage();
    }, [totalSum]);
    return (
        <>
            <img src={imageSrc} alt="Qr Scanner" height={100} width={100}/>
        </>
    )
}
export default QrCode;