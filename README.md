# Image_Segmentation_Using_Enhanced_UMRF
Markov Random Field (MRF) theory has a significant potential role in image segmentation field. It uses (pixels, regions, edges)-based on MRF models to detect objects, 
boundaries and other relevant information in an image. This paper proposes an extension of Unified Markov Random Field (UMRF) model to include edge-based features. 
Firstly, the proposed technique employs the likelihood function to combine the advantages of the pixel-based, region-based and edge-based MRF model, 
by computing the product of the pixel likelihood function, regional likelihood function and edge likelihood function. Secondly, the region-based macro 
texture features are extracted using the UMRF model. Then the edge-based features are extracted using the maximum gradient method to recover any significant 
lost information. A principled probabilistic inference is implemented to integrate various types of likelihood information and spatial constraints by iteratively 
updating the posterior probability of the proposed model. The segmentation process is completed when the iterations converge. The proposed enhanced UMRF technique 
which combines pixel-based, region-based and edge-based features achieved a higher skin lesion segmentation accuracy than MRF model which combines pixel-based and 
region-based only.
