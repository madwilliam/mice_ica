% Matlab function for duo regression
% data=nfeatures*ntime
% ica_components = IC_size*nIC
function [time_course,spacial_matrix] = duo_regression(data,ica_components)
    %normalize data
    normalized_data = normalize(data,1);
    centered_ica = ica_components-mean(ica_components,1);
    time_course = pinv(centered_ica)*normalized_data;
    centered_time_course = time_course-mean(time_course,2);
    spacial_matrix = normalized_data*pinv(centered_time_course);
end

function normalize_columns(data)
    ...
end
normA = TRUE #normalize mixing 
matrix AnQ <- ncol(GICA) #number of ICs
if(nQ > nV) warning('More ICs than voxels. Are you sure?')
if(nQ > nT) warning('More ICs than time points. Are you sure?')  # Center each voxel timecourse. Do not center the image at each timepoint.

# Standardize scale if `scale`, and detrend if `detrend_DCT`.
# Transpose it: now `BOLD` is TxV.
BOLD <- t(norm_BOLD(
BOLD, center_rows=TRUE, center_cols=center_Bcols,
scale=scale, scale_sm_xifti=scale_sm_xifti, scale_sm_FWHM=scale_sm_FWHM,
detrend_DCT=detrend_DCT
))  # Center each group IC across space. (Used to be a function argument.)
center_Gcols <- TRUE
if (center_Gcols) { GICA <- fMRItools::colCenter(GICA) }  # Estimate A (IC timeseries).
# We need to center `BOLD` across space because the linear model has no intercept.
A <- ((BOLD - rowMeans(BOLD, na.rm=TRUE)) %*% GICA) %*% chol2inv(chol(crossprod(GICA)))  # Center each subject IC timecourse across time.
# (Redundant. Since BOLD is column-centered, A is already column-centered.)
# A <- fMRItools::colCenter(A)  # Normalize each subject IC timecourse if `normA`.
if (normA) { A <- scale(A) }  # Estimate S (IC maps).
# Don't worry about the intercept: `BOLD` and `A` are centered across time.
S <- solve(a=crossprod(A), b=crossprod(A, BOLD))