masks = {};
for mice = 1:17
    mat = load(['/N/slate/zw72/average_per_mice_new/Mouse' num2str(mice) '.mat']);
    mask = mat.isbrain;
    masks{end+1} = mask;
end

intersection = masks{1};
for maski = masks
    maski = maski{1};
    intersection = intersect(intersection,maski);
end
imagesc(intersection)